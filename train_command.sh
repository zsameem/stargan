#! /bin/bash
CUDA_VISIBLE_DEVICES=8 python main.py --mode train --dataset CelebA --celeba_image_dir ./data/ResizedData/ --image_size 128 --c_dim 5 \
--sample_dir stargan_celeba/samples --log_dir stargan_celeba/logs \
--model_save_dir stargan_celeba/models --result_dir stargan_celeba/results 
