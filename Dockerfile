#
# This is the egress router for OpenShift Origin
#
# The standard name for this image is openshift/origin-egress-router

#FROM sha256:406beb407566f3bb774dbf0e2983695add889af754011ced9bf8dfd09ea39220
FROM registry.access.redhat.com/rhel7.4

ENV EGRESS_SOURCE=172.0.0.200
ENV EGRESS_GATEWAY=172.0.0.1
ENV EGRESS_DESTINATION=100.100.100.1

LABEL com.redhat.component="openshift-enterprise-egress-router-docker"
LABEL name="openshift3/ose-egress-router"
LABEL version="v3.6.173.0.21"
LABEL release="17"
LABEL architecture="x86_64"
LABEL io.k8s.display-name="OpenShift Container Platform Egress Router" \
      io.k8s.description="This is a component of OpenShift Container Platform and contains an egress router." \
      io.openshift.tags="openshift,router,egress"

RUN INSTALL_PKGS="iproute iputils net-tools" && \
    yum install -y $INSTALL_PKGS && \
    rpm -V $INSTALL_PKGS && \
    yum clean all

ADD arctiq-router.sh /bin/arctiq-router.sh

LABEL io.k8s.display-name="OpenShift Origin Egress Router" \
      io.k8s.description="This is a component of OpenShift Origin and contains an egress router." \
      io.openshift.tags="openshift,router,egress"

ENTRYPOINT /bin/arctiq-router.sh

LABEL "authoritative-source-url"="registry.access.redhat.com" "distribution-scope"="public" "vendor"="Red Hat, Inc." "description"="This is a component of OpenShift Origin and contains an egress router." "url"="https://access.redhat.com/containers/#/registry.access.redhat.com/openshift3/ose-egress-router/images/v3.6.173.0.21-17" "vcs-type"="git" "build-date"="2017-09-01T15:48:40.189727" "com.redhat.build-host"="rcm-img-docker02.build.eng.bos.redhat.com" "vcs-ref"="d860c63726d97c857517aba0172c159b76c5fceb"
