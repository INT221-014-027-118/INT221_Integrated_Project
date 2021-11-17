import {
  createRouter,
  createWebHistory
} from 'vue-router'

const routes = [{
    path: '/',
    name: 'Home',
    component: () => import( /* webpackChunkName: "home" */ '../views/Home.vue')
  },
  {
    path: '/team',
    name: 'Team',
    component: () => import( /* webpackChunkName: "team" */ '../views/Team.vue')
  },
  {
    path: '/form',
    name: 'Form',
    component: () => import( /* webpackChunkName: "form" */ '../views/Form.vue'),
    props: true
  },
  {
    path: '/edit=:itemId',
    name: 'FormEdit',
    component: () => import( /* webpackChunkName: "edit" */ '../views/Form.vue'),
    props: true
  },
  {
    path: '/products',
    name: 'ProductsList',
    component: () => import( /* webpackChunkName: "productsList" */ '../views/ProductsList.vue'),
    props: true
  },
  {
    path: '/products=:type',
    name: 'ProductsListTypes',
    component: () => import( /* webpackChunkName: "productsListTypr" */ '../views/ProductsList.vue'),
    props: true,
    children: [{
      path: ':productId',
      name: 'Product',
      props: true,
      component: () => import( /* webpackChunkName: "product" */ '../views/Product.vue')
    }],
  },
]

const router = createRouter({
  history: createWebHistory(process.env.BASE_URL),
  routes
})

export default router