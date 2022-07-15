# DNS 服务器

1. 定期更新ip库
2. 内置广告过滤

## start

```
mkdir -p ./conf/adguardhome/work
mkdir -p ./conf/adguardhome/conf
docker-compose pull
docker-compose up -d
```

## 注意事项
- dns 端口为 5335 web 端口为 3000
- NameServer 的通讯协议必须是 tcp