import { CORS_WHITELIST_URL_1, CORS_WHITELIST_URL_2 } from './main-config'; 
 
 const whitelist = [
    CORS_WHITELIST_URL_1,
    CORS_WHITELIST_URL_2,
  ];
 
 export const corsOptions = {
    origin: function (origin: any, callback: any) {
      // ⚠️ FOR DEVELOPMENT PHASE ONLY!
      console.log('Origin:', origin);
      console.log('Whitelist:', whitelist);

      if (!origin) {
         return callback(null, true);
     }
      if (whitelist.indexOf(origin) !== -1) {
        callback(null, true);
      } else {
        callback(new Error('Not allowed by CORS'));
      }
    },
  };
