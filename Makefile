VEEWEE = bundle exec veewee
VERSION := $(shell date +'%Y%m%d')

all: precise

precise: precise_virtualbox precise_vmware_fusion

precise_virtualbox: govuk_dev_precise64_$(VERSION).box
precise_vmware_fusion: govuk_dev_precise64_vmware_fusion_$(VERSION).box

govuk_dev_precise64_$(VERSION).box: govuk_dev_precise64.box
	cp -p govuk_dev_precise64.box govuk_dev_precise64_$(VERSION).box

govuk_dev_precise64_vmware_fusion_$(VERSION).box: govuk_dev_precise64_vmware_fusion.box
	cp -p govuk_dev_precise64_vmware_fusion.box govuk_dev_precise64_vmware_fusion_$(VERSION).box

govuk_dev_precise64.box: definitions/govuk_dev_precise64/*
	$(VEEWEE) vbox build -f govuk_dev_precise64
	$(VEEWEE) vbox export -f govuk_dev_precise64

govuk_dev_precise64_vmware_fusion.box: definitions/govuk_dev_precise64_vmware_fusion/*
	$(VEEWEE) fusion build -f govuk_dev_precise64_vmware_fusion
	$(VEEWEE) fusion export -f govuk_dev_precise64_vmware_fusion

clean: clean_precise64_virtualbox clean_precise64_vmware_fusion
	rm -f *.box

clean_precise64_virtualbox:
	$(VEEWEE) vbox destroy -f govuk_dev_precise64

clean_precise64_vmware_fusion:
	$(VEEWEE) fusion destroy -f govuk_dev_precise64_vmware_fusion

sync: sync_precise

sync_precise: sync_precise_virtualbox sync_precise_vmware_fusion

sync_precise_virtualbox:
	s3cmd sync --acl-public govuk_dev_precise64_$(VERSION).box 's3://gds-boxes/'

sync_precise_vmware_fusion:
	s3cmd sync --acl-public govuk_dev_precise64_vmware_fusion_$(VERSION).box 's3://gds-boxes/'
