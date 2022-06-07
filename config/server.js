module.exports = ({ env }) => ({
  host: env('HOST', '0.0.0.0'),
  port: env.int('PORT', 1337),
  url: `${env('URL_API','http://intranet-piramide.com')}${env('PREFIX','/strapi')}`,
  admin: {
    auth: {
      secret: env('ADMIN_JWT_SECRET', '673c510a4d79129984e6dd4721707f21'),
    },
  },
});

// module.exports = ({ env }) => ({
//   host: env('HOST', '0.0.0.0'),
//   port: env.int('PORT', 1337),
//   url: `${env('URL_API','')}${env('PREFIX','')}`,
//   admin: {
//     auth: {
//       secret: env('ADMIN_JWT_SECRET', '673c510a4d79129984e6dd4721707f21'),
//     },
//   },
// });
