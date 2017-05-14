var riot = require('riot')
require('./tags/app.tag')

document.addEventListener('DOMContentLoaded', () => riot.mount('app'))
