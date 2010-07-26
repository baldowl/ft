%w(tsclient xvnc4viewer rdesktop joe).each do |p|
  package p do
    action :upgrade
  end
end

execute 'profile addition' do
  command 'echo "\n\nexport MALLOC_CHECK_=0" >> .bashrc'
  not_if 'grep "MALLOC_CHECK_=0" ~ubuntu/.bashrc'
  cwd '/home/ubuntu'
  user 'ubuntu'
end
