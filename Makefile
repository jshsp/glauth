tpl:
	ansible-playbook playbook/tplk8s.yaml  -e "basedir=${CURDIR}" -e "env=master"

bp:
	bash scripty5/buildpush
