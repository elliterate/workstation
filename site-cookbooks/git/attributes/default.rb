node.default['workstation']['git']['editor'] = 'vim'

node.default['workstation']['git']['global_config'] = {
  'blame.ignoreRevsFile' => '.git-blame-ignore-revs',
  'core.pager' => '"delta --color-only"',
  'core.excludesfile' => "#{node['workstation']['home']}/.gitignore",
  'color.branch' => 'auto',
  'color.diff' => 'auto',
  'color.interactive' => 'auto',
  'color.status' => 'auto',
  'color.ui' => 'auto',
  'help.autocorrect' => -1,
  'init.defaultBranch' => 'main',
  'interactive.diffFilter' => '"delta --color-only"',
  'pull.ff' => 'only',
  'push.default' => 'simple',
  'alias.co' => 'checkout',
  'alias.lg' => 'log --graph',
  'alias.recent' => 'branch --sort=-committerdate --format="%(committerdate:relative)%09%(refname:short)"',
  'alias.st' => 'status'
}
