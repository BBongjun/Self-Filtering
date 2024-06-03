
# Reproducibility Study of Self-Filtering

We utilize [the official PyTorch Implementation of Self-Filtering](https://github.com/1998v7/Self-Filtering) provided by authors.

> Paper ["Self-Filtering: A Noise-Aware Sample Selection for Label Noise with Confidence Penalization"](https://www.ecva.net/papers/eccv_2022/papers_ECCV/papers/136900511.pdf) is accepted to **ECCV 2022**.

# Experiment setting for reproducing

### Add new argument for reproduction
`--fig_7` for Fig.7 reproduction

`--without_R`, `--without_Lcr` for table 7, Fig. 10 reproduction

`--save_sel_sam` for Fig.10 reproduction

`--fluctuation_ablation` for our implentation for fluctuation algorithm based on paper.

### Define our claims
• Claim 1 : SFT outperforms the almost state-of-the-art on CIFAR-10 with three noise types. (Table 1)
• Claim 2 : The regularization term in the warm-up stage effectively separates clean and noisy samples. (Fig 7)
• Claim 3 : The regularization terms improve the performance of SFT. (Table 7, Fig 10)
• Claim 4 : With a smaller T, SFT attains the best performance. (Fig 9)

### Hyper-parameter and settings

`k`  denotes memory bank size. It can be set as `[2,3,4]`. For all experiment, we set it as `3` follow original setting.

`T`  denotes threshold in confidence penalty. For all experiment, we set it as `0.2`

For CIFAR-10, `warm_up = 10`,`model = resnet18`

For CIFAR-100, `warm_up = 30`,`model = resnet34`

In our study, we focused on CIFAR-10 for simplification of the experiment.

### Run SFT
Before you run it, please download the CIFAR-10 dataset in `./datset` folder.

```
python main.py --dataset cifar10 --model resnet18 --batch_size 32 --lr 0.02 --warm_up 10 --num_epochs 100 --noise_mode instance --r 0.2 --k 2 --T 0.2 --gpuid 0
```

### Run for Claim 1

```

```




### Cite
If you find the code useful, please consider citing our paper:
```
@inproceedings{wei2022self,
  title={Self-Filtering: A Noise-Aware Sample Selection for Label Noise with Confidence Penalization},
  author={Wei, Qi and Sun, Haoliang and Lu, Xiankai and Yin, Yilong},
  booktitle={European Conference on Computer Vision},
  pages={516--532},
  year={2022},
  organization={Springer}
}
```
