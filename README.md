# Container to create PostgreSQL Backups

Minimalisitic container for backing up PostgreSQL databases.

<!-- TOC -->

- [Container to create PostgreSQL Backups](#container-to-create-postgresql-backups)
  - [Goal](#goal)
  - [Running the Backup CronJob in Kubernetes](#running-the-backup-cronjob-in-kubernetes)
    - [Step 1. Replace your Database creds](#step-1-replace-your-database-creds)
    - [Step 2. Create the resources](#step-2-create-the-resources)

<!-- /TOC -->

## Goal

Easily backup your PostgreSQL Database.

Intended to be used with:

1. Kubernetes for creating CronJobs that periodically back up your database to AWS S3.
2. Container Instances (e.g Azure Container Instances, AWS Fargate) that can be scheduled at specified times.
3. Your computer! It's smaller than pgAdmin.

## Running the Backup CronJob in Kubernetes

### Step 1. Replace your Database creds

Replace database creds in [pg-backup-cronJob.yaml](./kubernetes/pg-backup-cronJob.yaml). !Attention: This is for simplicity these should be replaced with Secrets.

Also, provide AWS access to the container. For example you can mount `AWS_ACCESS_KEY_ID` and `AWS_SECRET_ACCESS_KEY`
from a secret as environment variables.

### Step 2. Create the resources

Execute below command:

`kubectl create -f ./kubernetes`
