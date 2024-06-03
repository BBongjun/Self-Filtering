
# Reproducing  "Self-Filtering: A Noise-Aware Sample Selection for Label Noise with Confidence Penalization"

We utilize [the official PyTorch Implementation of Self-Filtering](https://github.com/1998v7/Self-Filtering) provided by authors.

> Paper ["Self-Filtering: A Noise-Aware Sample Selection for Label Noise with Confidence Penalization"](https://www.ecva.net/papers/eccv_2022/papers_ECCV/papers/136900511.pdf) is accepted to **ECCV 2022**.

# Experiment setting for reproducing

### Scope of reproducibility

- Claim 1 : SFT outperforms the almost state-of-the-art on CIFAR-10 with three noise types. (Table 1)
- Claim 2 : The regularization term in the warm-up stage effectively separates clean and noisy samples. (Fig 7)
- Claim 3 : The regularization terms improve the performance of SFT. (Table 7, Fig 10)
- Claim 4 : With a smaller T, SFT attains the best performance. (Fig 9)

To verify whether the model can robustly learn despite changes in initial model parameters and data distribution, we conducted additional experiments by changing only the data seed while keeping the model seed constant. Upon reviewing the code provided in the paper, we found discrepancies between the provided code and the method described in the paper. This is explained in the following 2.

- To verify whether the model can robustly learn despite changes in initial model parameters and data distribution, we conducted additional experiments by changing only the data seed while keeping the model seed constant.
- The authors proposed fluctuation, where samples are considered noisy if they transition from correct predictions to incorrect predictions. However, upon examining the implementation in the open-sourced code, we found that selection is based on both the prediction robabilities stored in the memory bank and the presence of fluctuation. Therefore, we implemented the fluctuation criterion as described in the paper and conducted experiments.

### Add new argument for reproduction
- `--fig_7` for Fig.7 reproduction

- `--without_R`, `--without_Lcr` for table 7, Fig. 10 reproduction

- `--save_sel_sam` for Fig.10 reproduction

- `--fluctuation_ablation` for our implementation for fluctuation algorithm based on paper.

- we utilize [Coteaching official code](https://github.com/bhanML/Co-teaching) and [JoCoR official code](https://github.com/hongxin001/JoCoR) for Claim 1.


### Hyper-parameter and settings

`k`  denotes memory bank size. It can be set as `[2,3,4]`. For all experiment, we set it as `3` follow original setting.

`T`  denotes threshold in confidence penalty. For all experiment, we set it as `0.2`

For CIFAR-10, `warm_up = 10`,`model = resnet18`

For CIFAR-100, `warm_up = 30`,`model = resnet34`

**In our study, we focused on CIFAR-10 for simplification of the experiment.**

### Run SFT
Before you run it, please download the CIFAR-10 dataset in `./datset` folder.

```
python main.py --dataset cifar10 --model resnet18 --batch_size 32 --lr 0.02 --warm_up 10 --num_epochs 100 --noise_mode instance --r 0.2 --k 2 --T 0.2 --gpuid 0
```

### Run for Claim 1

```

```

여기다 table 1 장표 넣기

### Run for Claim 2

```

```

여기다 fig 7 plot 넣기
### Run for Claim 3

```

```

### Run for Claim 4

```

```

### Run for ablation 1
```

```

### Run for ablation 1
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
