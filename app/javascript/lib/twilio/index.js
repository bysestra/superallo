import { getLogger } from 'loglevel'

export const Device = require("twilio-client").Device
export const logger = getLogger(Device.packageName)
