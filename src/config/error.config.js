

class ApiError extends Error {
    constructor(statusCode, message) {
        this.statusCode = statusCode
        this.message = message
    }
}

module.exports = ApiError