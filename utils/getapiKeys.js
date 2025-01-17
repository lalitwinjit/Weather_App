import ApiKey from '../models/ApiKey.js';

async function getApiKey(keyName) {
    const apiKeyRecord = await ApiKey.findOne({ where: { keyName } });

    if (!apiKeyRecord) {
        throw new Error(`API key for "${keyName}" not found.`);
    }

    return apiKeyRecord.keyValue;
}

export default getApiKey;