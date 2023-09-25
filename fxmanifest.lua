fx_version 'cerulean'
game 'gta5'

author 'StunZ'
description 'Simple Pizza job scripts for QBCore'
version '0.0.4'

client_scripts {
    'client/client.lua'
}

server_scripts {
    'server/server.lua'
}

dependencies {
    'qb-target',
    'qb-menu'
}

shared_scripts {
    'shared/config.lua'
}

lua54 'yes'
