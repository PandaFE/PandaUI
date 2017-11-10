import riot from 'riot'
import route from 'riot-route'
import 'riot-route/tag'
import 'riot-hot-reload'
import '@/mixins'
import '@/app'

route.base('/')
riot.mount('#app', 'app')
