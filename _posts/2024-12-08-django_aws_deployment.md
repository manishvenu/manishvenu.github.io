---
title: 'Deploying a Django Website as a confused Earth Science programmer'
date: 2024-12-08
permalink: /posts/2024/12/django_aws_deployment/
tags:
  - Django
  - AWS
  - EC2
---

Deploying a Django website is hard, especially if you don't know anything about linux, web servers, or front-end/back-end. In my case of setting up a website for a lake research project, it was impossible. Thankfully, leveraging a couple of very cool tutorials and taking shameless advantage of AWS free tier (which can then be transitioned to a free/cheap non-profit account cuz research is non-profit), we can deploy a Django website in HTTP! HTTPS - which has an extra S - has security, so you need to buy a domain (not free!) and get a free security certificate from something like Let's Encrypt - a company!

Here is an option to get the deployment working: [Steps of Django Deployment on AWS](https://manishvenu.github.io/MLDjango/manualdocs/deploy_to_ec2.html).

I'd only use this tutorial if you're a python coder who figured out Django, but knows nothing about how webservers (Apache2, NGINX) and linux servers work, which is like very common in earth science.

Feel free to email me when things don't work, it's fun to figure out. 