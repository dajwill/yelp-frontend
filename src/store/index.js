import { Subject, Observable } from 'rxjs/Subject'
import 'rxjs/add/operator/scan'
import 'rxjs/add/operator/startWith'
import axios from 'axios'

axios.defaults.headers.common['Authorization'] = 'Bearer eGuwe0MktbhJHGhC9kOFgU3mC216qfQiIal1yJLIiCvQ0EbYYPRHiqQiW0qTdLqp3yY6hfpezmzGCfstpYHj673diAToRut3tVyUSfNN0-1QOYxA4qg8rLXpuLwPWXYx'

const action$ = new Subject();

const initState = () => {
  return {
    search: {
      filter: 'all',
      query: 'food',
    },
    listings: [],
    favorites: []
  }
}

const reducer = (state, action) => {
  console.log('');
  switch(action.type) {
    case 'UPDATE_SEARCH':
      return {
        ...state,
        search: action.payload
      };
    default:
      return state;
  }
}

const store$ = action$
  .startWith(initState())
  .scan(reducer);

const actionDispatcher = (func) => (...args) => {
  return action$.next(func(...args))
}

// const actionDispatcher = (func) => console.log(func)

const newSearch = actionDispatcher((payload) => ({
  type: 'UPDATE_SEARCH',
  payload
}));

// const newSearch = actionDispatcher((payload) => {
//   console.log('yeee');
//   return {
//     type: 'UPDATE_SEARCH',
//     payload
//   }
// });

// const newSearch = () => console.log('yeee')

const fetchMusic = actionDispatcher((payload) => {
  return {
    type: 'FETCHING_RESULTS',
    payload: Observable.fromPromise(axios.get(`https://localhost:8081/search`))
  }
})

export {
  store$,
  newSearch
}
