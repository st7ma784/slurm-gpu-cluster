import os
import torch
from pytorch_lightning import LightningModule, Trainer
from pytorch_lightning.callbacks.progress import TQDMProgressBar
from torch.nn import functional as F
from torch.utils.data import DataLoader

import socket
class MNISTModel(LightningModule):
    def __init__(self):
        super().__init__()
        self.l1 = torch.nn.Linear(28 * 28, 10)
        print('NODE : {}'.format(socket.gethostname()))

    def forward(self, x):
        return torch.relu(self.l1(x.view(x.size(0), -1)))

    def training_step(self, batch, batch_nb):
        x, y = batch
        loss = F.cross_entropy(self(x), y)
        return loss

    def configure_optimizers(self):
        return torch.optim.Adam(self.parameters(), lr=0.02)

# Init our model
def train():
    mnist_model=MNISTModel()
    # Init DataLoader from MNIST Dataset
    train_ds =torch.utils.data.TensorDataset(torch.rand(100,28,28),torch.rand(100).to(dtype=torch.long)*10)
    train_loader = DataLoader(train_ds, batch_size=5,num_workers=2,prefetch_factor=2)

    # Initialize a trainer
    trainer = Trainer(
        accelerator="auto",
        devices="auto",  # limiting got iPython runs
        max_epochs=1,
        fast_dev_run=True,
        strategy="ddp",
        num_nodes=4,
        callbacks=[TQDMProgressBar(refresh_rate=20)],
    )
    print('CALLED ON NODE : {}'.format(socket.gethostname()))

    # Train the model ⚡
    trainer.fit(mnist_model, train_loader)
if __name__=="__main__":
    train()