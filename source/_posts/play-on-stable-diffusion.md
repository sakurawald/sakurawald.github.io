---
title: play on stable-diffusion
date: 2023-02-08 08:35:54
tags:
  - ai
  - gpt
  - diffusion
  - art
  - cg
  - practice
  - novel_ai
  - cuda
  - nvidia
  - python
  - computation
  - anime
  - draw
---

# Play on Stable-Diffusion

## Setup

> If you just want to use `stable-diffusion` **online**, you can try apps like: https://huggingface.co/spaces/stabilityai/stable-diffusion
>
> However, we highly recommend you setup `stable-diffusion` locally for higher customizability.



### Platform

#### Installation

`stable-diffusion webui` is a browser interface for `stable-diffusion`.

Firstly, use the following commands to install it.

```shell
git clone git@github.com:AUTOMATIC1111/stable-diffusion-webui.git
cd stable-diffusion-webui
bash webui.sh
```

#### Configuration

##### Optimise video memory-usage

```shell
# webui-user.sh
export COMMANDLINE_ARGS="--xformers"
```

For some GPUs with a high cuda version. (cuda > 11.8), you should **manually** install the **required python dependencies**

```shell
NVIDIA GeForce RTX 3080 Ti with CUDA capability sm_86 is not compatible with the current PyTorch installation.
The current PyTorch install supports CUDA capabilities sm_37 sm_50 sm_60 sm_70.
If you want to use the NVIDIA GeForce RTX 3080 Ti GPU with PyTorch, please check the instructions at Start Locally | PyTorch 31
```

See: https://pytorch.org/get-started/locally/

##### Solve the problem of generating a black-image/empty-image

```shell
# webui-user.sh
export COMMANDLINE_ARGS="--no-half-vae --disable-nan-check"
```

### Model

#### Installation

You can download the models from this link: https://rentry.org/sdmodels

> Q: Should we pay for the latest `NovelAI` now ?
>
> A: Maybe not, just wait for it to leak.
>
> ![image-20230208150000465](https://raw.githubusercontent.com/SakuraWald/sakurawald.github.io/main/images/TSL9TF0.png)

#### Configuration

The `stable-diffusion model` (sd-model) contains all the data needed to `generate an image`.

Beyond that, `a specific model` might also come with the `pre-configuration file` , `vae.pt file` and `hyper-network file`, which can be used to `modify and enhance the style of the final generated image`

For example, the architecture may be like: 

```shell
stable-diffusion-webui/
├─ models/
│  ├─ Stable-diffusion/
│  │  ├─ model_name.ckpt
│  │  ├─ model_name.yaml
│  ├─ VAE/
│  │  ├─ model_name.vae.pt
│  ├─ hypernetworks/
│  │  ├─ anime.pt
│  │  ├─ furry.pt
│  │  ├─ pony.pt
```

## Use-case

### Control the weight of prompts

Use `(token)` to strength the weight.

> For Novel-AI, use `{token}` instead.
>
> `stable-diffusion webui` 's coefficient differs from `novel-ai`

Use `[token]` to reduce the weight.

### The magic-spell to control the quality of generated-image

There are some `common prompts` called `magic-spell` which can be used to control the `quality` , `style` , `category` and `color`  of the image.

For examples:

#### Positive Prompts

```
(masterpiece), (best quality), (masterpiece),(best quality),(official art),(extremely detailed CG unity 8k wallpaper), 
```

```
(extremely detailed CG unity 8k wallpaper), (official concept art), (outline), (ultra-detailed), (lightfast), (highly detailed reflection), (best shadow),(schematic), (anime coloring)
```

> These websites provide prompt examples:
>
> 1. https://openart.ai/presets
> 2. https://prompthero.com/
> 3. https://stablediffusionweb.com/prompts

#### Negative Prompts

`negative prompt` is **essential** to get rid of `bad products`

```
lowres, bad anatomy, bad hands, text, missing fingers, extra digit, fewer digits, cropped, worst quality, low quality, from behind,from side,normal quality, jpeg artifacts, watermark, username, Missing limbs,three arms, bad feet,text font ui,malformed hands,long neck,long body,limb,bad anatomy disfigured malformed mutated,large head,(mutated hands and fingers :1.5).(long body :1.3),(mutation ,poorly drawn :1.2), disfigured, malformed, mutated,multiple breasts,three legs,
```

```
(((deformed))), blurry, bad anatomy, disfigured, poorly drawn face, mutation, mutated, (extra_limb), (ugly), (poorly drawn hands), fused fingers, messy drawing, broken legs censor, censored, censor_bar, multiple breasts, (mutated hands and fingers:1.5), (long body :1.3), (mutation, poorly drawn :1.2), black-white, bad anatomy, liquid body, liquidtongue, disfigured, malformed, mutated, anatomical nonsense, text font ui, error, malformed hands, long neck, blurred, lowers, low res, bad anatomy, bad proportions, bad shadow, uncoordinated body, unnatural body, fused breasts, bad breasts, huge breasts, poorly drawn breasts, extra breasts, liquid breasts, heavy breasts, missingbreasts, huge haunch, huge thighs, huge calf, bad hands, fused hand, missing hand, disappearing arms, disappearing thigh, disappearing calf, disappearing legs, fusedears, bad ears, poorly drawn ears, extra ears, liquid ears, heavy ears, missing ears, fused animal ears, bad animal ears, poorly drawn animal ears, extra animal ears, liquidanimal ears, heavy animal ears, missing animal ears, text, ui, error, missing fingers, missing limb, fused fingers, one hand with more than 5 fingers, one hand with less than5 fingers, one hand with more than 5 digit, one hand with less than 5 digit, extra digit, fewer digits, fused digit, missing digit, bad digit, liquid digit, colorful tongue, blacktongue, cropped, watermark, username, blurry, JPEG artifacts, signature, 3D, 3D game, 3D game scene, 3D character, malformed feet, extra feet, bad feet, poorly drawnfeet, fused feet, missing feet, extra shoes, bad shoes, fused shoes, more than two shoes, poorly drawn shoes, bad gloves, poorly drawn gloves, fused gloves, bad cum, poorly drawn cum, fused cum, bad hairs, poorly drawn hairs, fused hairs, big muscles, ugly, bad face, fused face, poorly drawn face, cloned face, big face, long face, badeyes, fused eyes poorly drawn eyes, extra eyes, malformed limbs, more than 2 nipples, missing nipples, different nipples, fused nipples, bad nipples, poorly drawnnipples, black nipples, colorful nipples, gross proportions. short arm, (((missing arms))), missing thighs, missing calf, missing legs, mutation, duplicate, morbid, mutilated, poorly drawn hands, more than 1 left hand, more than 1 right hand, deformed, (blurry), disfigured, missing legs, extra arms, extra thighs, more than 2 thighs, extra calf,fused calf, extra legs, bad knee, extra knee, more than 2 legs, bad tails, bad mouth, fused mouth, poorly drawn mouth, bad tongue, tongue within mouth, too longtongue, black tongue, big mouth, cracked mouth, bad mouth, dirty face, dirty teeth, dirty pantie, fused pantie, poorly drawn pantie, fused cloth, poorly drawn cloth, badpantie, yellow teeth, thick lips, bad camel toe, colorful camel toe, bad asshole, poorly drawn asshole, fused asshole, missing asshole, bad anus, bad pussy, bad crotch, badcrotch seam, fused anus, fused pussy, fused anus, fused crotch, poorly drawn crotch, fused seam, poorly drawn anus, poorly drawn pussy, poorly drawn crotch, poorlydrawn crotch seam, bad thigh gap, missing thigh gap, fused thigh gap, liquid thigh gap, poorly drawn thigh gap, poorly drawn anus, bad collarbone, fused collarbone, missing collarbone, liquid collarbone, strong girl, obesity, worst quality, low quality, normal quality, liquid tentacles, bad tentacles, poorly drawn tentacles, split tentacles, fused tentacles, missing clit, bad clit, fused clit, colorful clit, black clit, liquid clit, QR code, bar code, censored, safety panties, safety knickers, beard, furry, pony, pubic hair, mosaic, futa, testis, (((deformed))), blurry, bad anatomy, disfigured, poorly drawn face, mutation, mutated, (extra_limb), (ugly), (poorly drawn hands), fused fingers, messy drawing, broken legs censor, censored, censor_bar, multiple breasts, (mutated hands and fingers:1.5), (long body :1.3), (mutation, poorly drawn :1.2), black-white, bad anatomy, liquid body, liquidtongue, disfigured, malformed, mutated, anatomical nonsense, text font ui, error, malformed hands, long neck, blurred, lowers, low res, bad anatomy, bad proportions, bad shadow, uncoordinated body, unnatural body, fused breasts, bad breasts, huge breasts, poorly drawn breasts, extra breasts, liquid breasts, heavy breasts, missingbreasts, huge haunch, huge thighs, huge calf, bad hands, fused hand, missing hand, disappearing arms, disappearing thigh, disappearing calf, disappearing legs, fusedears, bad ears, poorly drawn ears, extra ears, liquid ears, heavy ears, missing ears, fused animal ears, bad animal ears, poorly drawn animal ears, extra animal ears, liquidanimal ears, heavy animal ears, missing animal ears, text, ui, error, missing fingers, missing limb, fused fingers, one hand with more than 5 fingers, one hand with less than5 fingers, one hand with more than 5 digit, one hand with less than 5 digit, extra digit, fewer digits, fused digit, missing digit, bad digit, liquid digit, colorful tongue, blacktongue, cropped, watermark, username, blurry, JPEG artifacts, signature, 3D, 3D game, 3D game scene, 3D character, malformed feet, extra feet, bad feet, poorly drawnfeet, fused feet, missing feet, extra shoes, bad shoes, fused shoes, more than two shoes, poorly drawn shoes, bad gloves, poorly drawn gloves, fused gloves, bad cum, poorly drawn cum, fused cum, bad hairs, poorly drawn hairs, fused hairs, big muscles, ugly, bad face, fused face, poorly drawn face, cloned face, big face, long face, badeyes, fused eyes poorly drawn eyes, extra eyes, malformed limbs, more than 2 nipples, missing nipples, different nipples, fused nipples, bad nipples, poorly drawnnipples, black nipples, colorful nipples, gross proportions. short arm, (((missing arms))), missing thighs, missing calf, missing legs, mutation, duplicate, morbid, mutilated, poorly drawn hands, more than 1 left hand, more than 1 right hand, deformed, (blurry), disfigured, missing legs, extra arms, extra thighs, more than 2 thighs, extra calf,fused calf, extra legs, bad knee, extra knee, more than 2 legs, bad tails, bad mouth, fused mouth, poorly drawn mouth, bad tongue, tongue within mouth, too longtongue, black tongue, big mouth, cracked mouth, bad mouth, dirty face, dirty teeth, dirty pantie, fused pantie, poorly drawn pantie, fused cloth, poorly drawn cloth, badpantie, yellow teeth, thick lips, bad camel toe, colorful camel toe, bad asshole, poorly drawn asshole, fused asshole, missing asshole, bad anus, bad pussy, bad crotch, badcrotch seam, fused anus, fused pussy, fused anus, fused crotch, poorly drawn crotch, fused seam, poorly drawn anus, poorly drawn pussy, poorly drawn crotch, poorlydrawn crotch seam, bad thigh gap, missing thigh gap, fused thigh gap, liquid thigh gap, poorly drawn thigh gap, poorly drawn anus, bad collarbone, fused collarbone, missing collarbone, liquid collarbone, strong girl, obesity, worst quality, low quality, normal quality, liquid tentacles, bad tentacles, poorly drawn tentacles, split tentacles, fused tentacles, missing clit, bad clit, fused clit, colorful clit, black clit, liquid clit, QR code, bar code, censored, safety panties, safety knickers, beard, furry, pony, pubic hair, mosaic, futa, testis
```

### Text-to-image

You can use some ready-made prompts to get started **or** write your prompt from scratch.

> Prompt-auxiliary: 
>
> 1. https://huggingface.co/spaces/Gustavosta/MagicPrompt-Stable-Diffusion
> 2. https://wolfchen.top/tag/

Some recommended params:

- Sample method: `Euler a` or `DDIM`
- Sample steps: about 30 ~ 40 is good
- Width & Height: you can use a small resolution for testing, and then generate a high-resolution image by `Hires. fix`. (Power of 2 preferred)
- CFG Scale: about 5~7 is good, 
- VAE: select `auto` and keep the same `model_name` between `model_name.ckpt` and `model_name.vae.pt`
- hypernetworks: simply add this `token` into your `prompt`:  ` <hypernet:anime:1>`
- skip-clip: default 1, set to `2` if you are using `novel-diffusion`



#### Example

##### Case 1

```
(extremely detailed CG unity 8k wallpaper), (official concept art), (outline), (ultra-detailed), (lightfast), (highly detailed reflection), (best shadow),(schematic), (anime coloring), 1girl, animal_ears, bell, bracelet, choker, collar, fox_mask, fox_tail, fur_trim, gradient, gradient_background, grey_background, hair_bell, japanese_clothes, jingle_bell, kimono, mask, mask_on_head, mask_removed, multiple_tails, neck_bell, red_eyes, short_hair, solo, tail, tail_bell, tail_ornament, white_hair, wide_sleeves
```

![image-20230208150646685](https://raw.githubusercontent.com/SakuraWald/sakurawald.github.io/main/images/Q283LSb.jpg)

![image-20230208150706389](https://raw.githubusercontent.com/SakuraWald/sakurawald.github.io/main/images/lijzFhH.jpg)

![image-20230208150714475](https://i.imgur.com/x9rov6R.png)

##### Case 2

```
1girl, :d, animal_ears, architecture, bangs, blue_hair, blush, breasts, building, east_asian_architecture, eyebrows_visible_through_hair, fox_mask, hakama, hakama_skirt, holding, japanese_clothes, kimono, long_hair, long_sleeves, looking_at_viewer, mask, mask_on_head, miko, open_mouth, outdoors, purple_eyes, ribbon-trimmed_sleeves, ribbon_trim, sash, smile, solo, white_kimono, wide_sleeves
```

![img](https://raw.githubusercontent.com/SakuraWald/sakurawald.github.io/main/images/vw69NCp.png)

![image-20230208153950160](https://raw.githubusercontent.com/SakuraWald/sakurawald.github.io/main/images/nYSG36u.png)



### Image-to-image

If you want to draw another-image based on original-image, you can use `image-to-image`

`tag reverse` can help you to analyze the tags from the original-image:

> See: https://gigazine.net/gsc_news/en/20221012-automatic1111-stable-diffusion-webui-deep-danbooru/

```shell
# webui-user.sh
export COMMANDLINE_ARGS="--deepdanbooru"
```

#### Example

##### Case 1

**parameters**

```
(extremely detailed CG unity 8k wallpaper), (official concept art), (outline), (ultra-detailed), (lightfast), (highly detailed reflection), (best shadow),(schematic), (anime coloring), aerial_fireworks, architecture, bow, building, city_lights, cloud, constellation, east_asian_architecture, festival, fire, fireworks, fish, full_moon, galaxy, goldfish, jack-o'-lantern, japanese_clothes, kimono, lantern, long_hair, milky_way, moon, multiple_girls, night, night_sky, paper_lantern, scenery, shooting_star, sitting, sky, smile, snow, snowing, space, star_\(sky\), starry_sky, starry_sky_print, summer_festival, tanabata, tanzaku, telescope, town, yukata
Negative prompt: (((deformed))), blurry, bad anatomy, disfigured, poorly drawn face, mutation, mutated, (extra_limb), (ugly), (poorly drawn hands), fused fingers, messy drawing, broken legs censor, censored, censor_bar, multiple breasts, (mutated hands and fingers:1.5), (long body :1.3), (mutation, poorly drawn :1.2), black-white, bad anatomy, liquid body, liquidtongue, disfigured, malformed, mutated, anatomical nonsense, text font ui, error, malformed hands, long neck, blurred, lowers, low res, bad anatomy, bad proportions, bad shadow, uncoordinated body, unnatural body, fused breasts, bad breasts, huge breasts, poorly drawn breasts, extra breasts, liquid breasts, heavy breasts, missingbreasts, huge haunch, huge thighs, huge calf, bad hands, fused hand, missing hand, disappearing arms, disappearing thigh, disappearing calf, disappearing legs, fusedears, bad ears, poorly drawn ears, extra ears, liquid ears, heavy ears, missing ears, fused animal ears, bad animal ears, poorly drawn animal ears, extra animal ears, liquidanimal ears, heavy animal ears, missing animal ears, text, ui, error, missing fingers, missing limb, fused fingers, one hand with more than 5 fingers, one hand with less than5 fingers, one hand with more than 5 digit, one hand with less than 5 digit, extra digit, fewer digits, fused digit, missing digit, bad digit, liquid digit, colorful tongue, blacktongue, cropped, watermark, username, blurry, JPEG artifacts, signature, 3D, 3D game, 3D game scene, 3D character, malformed feet, extra feet, bad feet, poorly drawnfeet, fused feet, missing feet, extra shoes, bad shoes, fused shoes, more than two shoes, poorly drawn shoes, bad gloves, poorly drawn gloves, fused gloves, bad cum, poorly drawn cum, fused cum, bad hairs, poorly drawn hairs, fused hairs, big muscles, ugly, bad face, fused face, poorly drawn face, cloned face, big face, long face, badeyes, fused eyes poorly drawn eyes, extra eyes, malformed limbs, more than 2 nipples, missing nipples, different nipples, fused nipples, bad nipples, poorly drawnnipples, black nipples, colorful nipples, gross proportions. short arm, (((missing arms))), missing thighs, missing calf, missing legs, mutation, duplicate, morbid, mutilated, poorly drawn hands, more than 1 left hand, more than 1 right hand, deformed, (blurry), disfigured, missing legs, extra arms, extra thighs, more than 2 thighs, extra calf,fused calf, extra legs, bad knee, extra knee, more than 2 legs, bad tails, bad mouth, fused mouth, poorly drawn mouth, bad tongue, tongue within mouth, too longtongue, black tongue, big mouth, cracked mouth, bad mouth, dirty face, dirty teeth, dirty pantie, fused pantie, poorly drawn pantie, fused cloth, poorly drawn cloth, badpantie, yellow teeth, thick lips, bad camel toe, colorful camel toe, bad asshole, poorly drawn asshole, fused asshole, missing asshole, bad anus, bad pussy, bad crotch, badcrotch seam, fused anus, fused pussy, fused anus, fused crotch, poorly drawn crotch, fused seam, poorly drawn anus, poorly drawn pussy, poorly drawn crotch, poorlydrawn crotch seam, bad thigh gap, missing thigh gap, fused thigh gap, liquid thigh gap, poorly drawn thigh gap, poorly drawn anus, bad collarbone, fused collarbone, missing collarbone, liquid collarbone, strong girl, obesity, worst quality, low quality, normal quality, liquid tentacles, bad tentacles, poorly drawn tentacles, split tentacles, fused tentacles, missing clit, bad clit, fused clit, colorful clit, black clit, liquid clit, QR code, bar code, censored, safety panties, safety knickers, beard, furry, pony, pubic hair, mosaic, futa, testis, (((deformed))), blurry, bad anatomy, disfigured, poorly drawn face, mutation, mutated, (extra_limb), (ugly), (poorly drawn hands), fused fingers, messy drawing, broken legs censor, censored, censor_bar, multiple breasts, (mutated hands and fingers:1.5), (long body :1.3), (mutation, poorly drawn :1.2), black-white, bad anatomy, liquid body, liquidtongue, disfigured, malformed, mutated, anatomical nonsense, text font ui, error, malformed hands, long neck, blurred, lowers, low res, bad anatomy, bad proportions, bad shadow, uncoordinated body, unnatural body, fused breasts, bad breasts, huge breasts, poorly drawn breasts, extra breasts, liquid breasts, heavy breasts, missingbreasts, huge haunch, huge thighs, huge calf, bad hands, fused hand, missing hand, disappearing arms, disappearing thigh, disappearing calf, disappearing legs, fusedears, bad ears, poorly drawn ears, extra ears, liquid ears, heavy ears, missing ears, fused animal ears, bad animal ears, poorly drawn animal ears, extra animal ears, liquidanimal ears, heavy animal ears, missing animal ears, text, ui, error, missing fingers, missing limb, fused fingers, one hand with more than 5 fingers, one hand with less than5 fingers, one hand with more than 5 digit, one hand with less than 5 digit, extra digit, fewer digits, fused digit, missing digit, bad digit, liquid digit, colorful tongue, blacktongue, cropped, watermark, username, blurry, JPEG artifacts, signature, 3D, 3D game, 3D game scene, 3D character, malformed feet, extra feet, bad feet, poorly drawnfeet, fused feet, missing feet, extra shoes, bad shoes, fused shoes, more than two shoes, poorly drawn shoes, bad gloves, poorly drawn gloves, fused gloves, bad cum, poorly drawn cum, fused cum, bad hairs, poorly drawn hairs, fused hairs, big muscles, ugly, bad face, fused face, poorly drawn face, cloned face, big face, long face, badeyes, fused eyes poorly drawn eyes, extra eyes, malformed limbs, more than 2 nipples, missing nipples, different nipples, fused nipples, bad nipples, poorly drawnnipples, black nipples, colorful nipples, gross proportions. short arm, (((missing arms))), missing thighs, missing calf, missing legs, mutation, duplicate, morbid, mutilated, poorly drawn hands, more than 1 left hand, more than 1 right hand, deformed, (blurry), disfigured, missing legs, extra arms, extra thighs, more than 2 thighs, extra calf,fused calf, extra legs, bad knee, extra knee, more than 2 legs, bad tails, bad mouth, fused mouth, poorly drawn mouth, bad tongue, tongue within mouth, too longtongue, black tongue, big mouth, cracked mouth, bad mouth, dirty face, dirty teeth, dirty pantie, fused pantie, poorly drawn pantie, fused cloth, poorly drawn cloth, badpantie, yellow teeth, thick lips, bad camel toe, colorful camel toe, bad asshole, poorly drawn asshole, fused asshole, missing asshole, bad anus, bad pussy, bad crotch, badcrotch seam, fused anus, fused pussy, fused anus, fused crotch, poorly drawn crotch, fused seam, poorly drawn anus, poorly drawn pussy, poorly drawn crotch, poorlydrawn crotch seam, bad thigh gap, missing thigh gap, fused thigh gap, liquid thigh gap, poorly drawn thigh gap, poorly drawn anus, bad collarbone, fused collarbone, missing collarbone, liquid collarbone, strong girl, obesity, worst quality, low quality, normal quality, liquid tentacles, bad tentacles, poorly drawn tentacles, split tentacles, fused tentacles, missing clit, bad clit, fused clit, colorful clit, black clit, liquid clit, QR code, bar code, censored, safety panties, safety knickers, beard, furry, pony, pubic hair, mosaic, futa, testis
Steps: 40, Sampler: Euler a, CFG scale: 6, Seed: [?], Size: 1024x702, Model hash: 8712e20a5d, Model: [anything-diffusion] Anything-V3.0, Denoising strength: 0.75, Mask blur: 4
```

**original-image**

![original-image](https://raw.githubusercontent.com/SakuraWald/sakurawald.github.io/main/images/9y5jBfQ.png)

**generated-image**

![image-20230208154144700](https://raw.githubusercontent.com/SakuraWald/sakurawald.github.io/main/images/tXKbX94.jpg)

![image-20230208144901544](https://raw.githubusercontent.com/SakuraWald/sakurawald.github.io/main/images/BZUntu6.jpg)

## References

1. https://blog.csdn.net/weixin_53065229/article/details/127814292
2. https://www.bilibili.com/read/cv19113199?from=articleDetail
3. https://www.bilibili.com/read/cv19060316?from=search
4. https://gigazine.net/gsc_news/en/20221012-automatic1111-stable-diffusion-webui-deep-danbooru/
