import hilog from '@ohos.hilog';

class Logger {
  private domain: number;
  private prefix: string;
  private format: string = '%{public}s,%{public}s';

  constructor(prefix: string) {
    this.prefix = prefix;
    this.domain = 0x0001;
  }

  debug(...args: string[]): void {
    const message = args.join(' ');
    hilog.debug(this.domain, this.prefix, this.format, [message]);
  }

  info(...args: string[]): void {
    const message = args.join(' ');
    hilog.info(this.domain, this.prefix, this.format, [message]);
  }

  warn(...args: string[]): void {
    const message = args.join(' ');
    hilog.warn(this.domain, this.prefix, this.format, [message]);
  }

  error(...args: string[]): void {
    const message = args.join(' ');
    hilog.error(this.domain, this.prefix, this.format, [message]);
  }

  // 如果需要处理非字符串类型，可以使用重载
  debugWithObject(message: string, obj: object): void {
    const objString = JSON.stringify(obj);
    hilog.debug(this.domain, this.prefix, this.format, [`${message}: ${objString}`]);
  }

  infoWithObject(message: string, obj: object): void {
    const objString = JSON.stringify(obj);
    hilog.info(this.domain, this.prefix, this.format, [`${message}: ${objString}`]);
  }

  warnWithObject(message: string, obj: object): void {
    const objString = JSON.stringify(obj);
    hilog.warn(this.domain, this.prefix, this.format, [`${message}: ${objString}`]);
  }

  errorWithObject(message: string, obj: object): void {
    const objString = JSON.stringify(obj);
    hilog.error(this.domain, this.prefix, this.format, [`${message}: ${objString}`]);
  }
}

export default new Logger('[thmooC_App]');