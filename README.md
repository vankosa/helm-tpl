## Установка

```bash
$ helm init --client-only
$ helm upgrade appname-branch . \\
    --install --wait --force \\
    --namespace="${CI_PROJECT_NAMESPACE}" \\
    --set global.version="${K8S_APP_VER}" \\
    --set-string appname.image.version="${APP_VERSION}" \\
    --set global.environment="staging"
```

## Удаление

```bash
helm delete --purge appname-branch
```

## Содержимое

1. `Chart.yaml` - содержит имя чарта, его версию и описание;
2. `values.yaml` - стандартные параметры деплоя, могут быть изменены опциями `--set` и `--set-string` (если используется целочисленное значение) во время деплоя;
3. `templates/deployment.yaml` - описание деплоя приложения, фактически поднимает в k8s replica-set и pods;
4. `templates/job.yaml` - описание выполняемых задач, может быть описан в качестве helm хука (в текущих реалиях только post-install и post-upgrade). Создаёт базу, пользователей, удаляет базу, пользователей, выполняет различные вебхуки;
5. `templates/service.yaml` - описывает сервис, который доступен только внутри k8s кластера;
6. `templates/ingress.yaml` - описывает внешний доступ к приложению;
7. `templates/secrets.yaml` - описывает секреты, пароли, ключи;
8. `templates/_helpers.tpl` - содержит различные шаблоны, применяемые в чарте;
