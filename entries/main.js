import riot from 'riot'
import route from 'riot-route'
import extend from 'lodash/extend'
import 'riot-route/tag'
import 'riot-hot-reload'
import '@/app'

riot.mixin({
  extend
})
route.base('/')
riot.mount('app')
