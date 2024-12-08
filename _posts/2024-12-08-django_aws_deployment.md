---
title: 'Deploying a Django Website as a bad Earth Science programmer'
date: 2024-12-08
permalink: /posts/2024/12/django_aws_deployment/
tags:
  - Django
  - AWS
  - EC2
---

Deploying a Django website is hard, especially if you don't know what your doing. So in my case of setting up a cool website for a cool lake research project, it's impossible. Thankfully, leveraging a couple of very cool tutorials and taking extremely shameless advantage of AWS free tier (which we can then think about transitioning to a (free/cheap) non-profit account once we're ready cuz research is non-profit!), we can deploy a Django website in HTTP. (HTTPS (this has an extra S guys) has security, so you need to buy a domain (not free!) and get a free security certificate from something like Let's Encrypt - a company!). 

I did this for a research project recently, but here is an option to get the deployment working: [Steps of Django Deployment on AWS](https://manishvenu.github.io/MLDjango/manualdocs/deploy_to_ec2.html).

I'd only use this tutorial if you're a python god who figured out Django, but knows nothing about how webservers (Apache2, NGINX) and linux servers work, which is like super common in earth science.

Feel free to email me when things don't work, it's fun to figure out. 