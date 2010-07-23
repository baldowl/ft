%w(tsclient xvnc4viewer rdesktop joe).each do |p|
  package p do
    action :upgrade
  end
end

execute 'profile addition' do
  command 'echo -e "\n\nexport MALLOC_CHECK_=0" > .bashrc'
  not_if 'grep "MALLOC_CHECK_=0" .bashrc'
  cwd '/home/ubuntu'
  user 'ubuntu'
end
