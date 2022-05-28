fx_version 'cerulean'
game 'gta5'
lua54 'yes'
use_fxv2_oal 'yes'

name 'atl-ui'
author 'Atlas Framework Developers'
version '0.0.1'

ui_page 'dist/index.html'

files {
    'dist/**/*',
}

client_scripts {
    'client/*.lua',
}

server_scripts {

}

provide 'ui'