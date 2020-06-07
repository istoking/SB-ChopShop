fx_version 'adamant'

game 'gta5'

client_scripts {
   '@es_extended/locale.lua',
   'locales/en.lua',
   'client/client.lua',
   'client/functions.lua',
   'config.lua',
}

server_scripts {
   '@es_extended/locale.lua',
   'locales/en.lua',
   'server/main.lua',
   'config.lua',
}

dependencies {
   'disc-base',
   'disc-gcphone',
   'mythic_notify',
   'progressBars',
}
