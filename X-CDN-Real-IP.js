'use strict';

exports.handler = (event, context, callback) => {
    const request = event.Records[0].cf.request;
    const headers = request.headers;

    headers['x-cdn-real-ip'] = [{
        key: 'X-CDN-Real-IP',
        value: request['clientIp']
    }];

    callback(null, request);
};
