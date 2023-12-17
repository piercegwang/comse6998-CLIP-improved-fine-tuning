
# Table of Contents

1.  [Structure](#org70605f5)
2.  [Setup](#org8b846f5)
3.  [Completed Models](#orgdf477d3)

In this project, we attempted to fine-tune CLIP using delta-tuning techniques from OpenDelta. In particular, we used the Adapter Model which adds extra layers in between the layers of the CLIP model and allows us to fine tune just those layers&rsquo; parameters.

The code in this repository is modularized in outline form in a Google Colab notebook.


<a id="org70605f5"></a>

# Structure

-   The code for the main part of this project lives in the `clip_delta.ipynb` file.
-   Also important, is our modified version of `opendelta`, which contains some necessary fixes for their codebase and its operation in our project.


<a id="org8b846f5"></a>

# Setup

1.  Copy both the `.ipynb` file and the `opendelta` folder into a designated folder in Google Drive
2.  Open the notebook, and follow the code blocks sequentially there to run all of the appropriate code.
    1.  Setup will require a Kaggle account and key to download the necessary `flickr8k` dataset! See placeholders in node.


<a id="orgdf477d3"></a>

# Completed Models

We have provided a couple pre-trained models in the `saves` folder as well. If you wish to load them into the notebook, just jump to the **Testing** section, and set up the model accordingly:

    model = CLIPModel(delta_tuning = {'image_proj_fc':False,'image_proj_proj':False,'text_proj_fc':False, 'text_proj_proj':False}).to(CFG.device)

    model = CLIPModel(delta_tuning={'image_proj_fc':True,'image_proj_proj':True,'text_proj_fc':True, 'text_proj_proj':True},
                      image_proj_fc_bottleneck=5,
                      image_proj_proj_bottleneck=30,
                      text_proj_fc_bottleneck=100,
                      text_proj_proj_bottleneck=100).to(CFG.device)

