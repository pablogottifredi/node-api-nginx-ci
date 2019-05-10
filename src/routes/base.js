import { Router } from 'express'
import items from './items'

export default Router()
  .use('/items/', items )
