
module.exports = {
    accessTokenPrivateKey: process.env.ACCESS_TOKEN_PRIVATE_KEY,
    refreshTokenPrivateKey: process.env.REFRESH_TOKEN_PRIVATE_KEY,
    algorithm: 'RS256',
    accessTokenExpiration: 60 * 60,
    refreshTokenExpiration: '1d'
}