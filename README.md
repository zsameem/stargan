## Running in Docker

To build a docker image with the necessary dependencies, `dockerfile` is provided. Build the
image with the command `nvidia-docker build -t car2car-pytorch ./`

Default command to train on the CompCars dataset is provided in the `train_command.sh`. To run
it inside docker execute the command 

```bash
nvidia-docker run -ti --volume=$(pwd):<source root dir> \
-w <source root dir> -u $(id -u):$(id -g) car2car-pytorch:latest \ 
./train_command.sh

nvidia-docker run -ti --volume=$(pwd):/localhome/team07/stargan \
-w /localhome/team07/stargan -u $(id -u):$(id -g) car2car-pytorch:latest \
./train_command.sh
```

## Paper
[StarGAN: Unified Generative Adversarial Networks for Multi-Domain Image-to-Image Translation](https://arxiv.org/abs/1711.09020) <br/>
[Yunjey Choi](https://github.com/yunjey)<sup> 1,2</sup>, [Minje Choi](https://github.com/mjc92)<sup> 1,2</sup>, [Munyoung Kim](https://www.facebook.com/munyoung.kim.1291)<sup> 2,3</sup>, [Jung-Woo Ha](https://www.facebook.com/jungwoo.ha.921)<sup> 2</sup>, [Sung Kim](https://www.cse.ust.hk/~hunkim/)<sup> 2,4</sup>, and [Jaegul Choo](https://sites.google.com/site/jaegulchoo/)<sup> 1,2</sup>    <br/>
<sup>1 </sup>Korea University, <sup>2 </sup>Clova AI Research (NAVER Corp.), <sup>3 </sup>The College of New Jersey, <sup> 4 </sup>HKUST  <br/>
IEEE Conference on Computer Vision and Pattern Recognition ([CVPR](http://cvpr2018.thecvf.com/)), 2018 (<b>Oral</b>) 

<br/>
