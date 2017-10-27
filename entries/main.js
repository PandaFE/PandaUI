import riot from 'riot'
import route from 'riot-route'
import 'riot-route/tag'
import 'riot-hot-reload'
import '@/app'

route.base('/')
riot.mount('app')
