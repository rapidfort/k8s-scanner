import sys
from kubernetes import client, config

def main():
    config.load_incluster_config()

    v1 = client.CoreV1Api()
    image_set = set()
    ret = v1.list_pod_for_all_namespaces(watch=False)
    for i in ret.items:
        container_statuses = i.status.container_statuses
        for container_status in container_statuses:
            image_set.add(container_status.image)


    dump_path=sys.argv[1]
    with open(dump_path, mode='wt', encoding='utf-8') as image_list:
        image_list.write('\n'.join(list(image_set)))

if __name__ == '__main__':
    main()
