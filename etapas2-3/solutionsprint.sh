#!/bin/bash

# oc login --token=... --server=...

# oc delete project rm-342971
# oc new-project rm-342971 --display-name='Herberts da Silva Cruz Fortuna'

oc delete all --selector app=blog-django-py-git
oc delete all --selector app=sample-database
oc delete secret sample-database
oc delete pvc sample-database

oc new-app openshiftkatacoda/blog-django-py --name blog-django-py-git

oc expose service/blog-django-py-git

oc new-app postgresql-persistent --name sample-database --param DATABASE_SERVICE_NAME=sample-database --param POSTGRESQL_USER=sampledb --param POSTGRESQL_PASSWORD=sampledb --param POSTGRESQL_DATABASE=sampledb

oc set env deployment/blog-django-py-git DATABASE_URL=postgresql://sampledb:sampledb@sample-database:5432/sampledb

oc set env deployment/blog-django-py-git BLOG_SITE_NAME=RM-342971

oc set env deployment/blog-django-py-git BLOG_BANNER_COLOR=black



oc exec $(oc get pods --selector deployment=blog-django-py-git -o name) -- cp .s2i/action_hooks/setup .

oc rsh $(oc get pods --selector deployment=blog-django-py-git -o name)

# ./setup
# Username: rm-342971
# Email address: rm-342971@local.com
# Password: 3TSfylLD
# exit
