dsre_env:
  virtualenv.managed:
    - user: interview
    - name: /home/interview/dsre_env
    - pip_pkgs:
      - django

dsre_repo:
  git.latest:
    - name: git://github.com/KaiSforza/dsre
    - target: /home/interview/dsre
    - user: interview

dsre_run:
  cmd.run:
    - name: /home/interview/dsre_env/bin/python2 /home/interview/dsre/dsre/manage.py runserver 80
    - watch:
      - virtualenv: dsre_env
      - git: dsre_repo
