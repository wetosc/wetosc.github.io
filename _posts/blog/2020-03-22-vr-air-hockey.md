---
layout: post
title: Air Hockey VR
excerpt: "Thoughts on VR game development"
categories: blog
tags: [VR, unity, game, air hockey]
image:
  feature: air-hockey.png
  credit: Eugeniu Cernei
share: true
ads: false
---

During a university course, I had the task to build something VR-related. My choice fell on Air Hockey because it's simpler and sounds fancier than table tennis.

The VR field is still in development; Most of the games are focused on VR headsets, like Oculus Rift, Playstation VR, Samsung Gear VR. While they cover a wide range of prices and platforms, I think the casual niche is left out. That's why I wanted to explore controls and mechanics available in each smartphone, more precisely head movement tracking.

## Notes on head-controlled games
During the development I met several difficulties, some of which were left unsolved:

* Player height:
    When you interact with the context in a passive manner, it doesn't matter that a button is 20 cm higher or lower.
    In more active interactions the height disparities create discomfort. One of the solutions I thought of is to allow the player to adjust the camera in settings (to make it higher / lower) until they have a comfortable point of view.
* Neck muscle fatigue:
    A VR headset, even a cardboard one implies additional weight for your neck muscles. Add to it the head movements needed to play the game and you might even strain some muscles. To solve this I adjusted the levels to a shorter play time: the first player to get 5 points wins, which amounts to around 30 s - 1 min. Another solution would be to create pauses where we encourage players to stretch their necks and relax.
* Lack of control:
    We are used to doing things with our hands. When the single control you have is your head, you might feel powerless an try to move things with your hands, without result. In a dynamic game, the player feels that something is missing; that's why more calm games might be better suited for this type of control.

## Further development
I haven't decided yet on publishing the game or its source code; at the moment it's just another unfinished pet project. The next step would be to test the game and collect feedback.

## Demo

{% include youtubePlayer.html id="zMMyqB87SGc" %}