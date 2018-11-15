dsre_python:
  pkg.installed:
    - name: python3

dsre_env:
  virtualenv.managed:
    - user: interview
    - name: /home/interview/dsre_env
    - python: /usr/bin/python3
    - pip_pkgs:
      - django
    - watch:
      - pkg: dsre_python

dsre_repo:
  git.latest:
    - name: git://github.com/KaiSforza/dsre
    - target: /home/interview/dsre
    - user: interview

dsre_run:
  cmd.run:
    - name: /home/interview/dsre_env/bin/python /home/interview/dsre/dsre/manage.py runserver 80 &
    - watch:
      - virtualenv: dsre_env
      - git: dsre_repo
