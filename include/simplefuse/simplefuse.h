#ifndef __SIMPLEFUSE_H__
#define __SIMPLEFUSE_H__


#ifdef __cplusplus
extern "C" {
#endif

int sfuse_open(const char *pathname, int flags);

int sfuse_close(int fd);

ssize_t sfuse_read(int fd, void *buf, size_t count);

ssize_t sfuse_write(int fd, const void *buf, size_t count);


#ifdef __cplusplus
}
#endif

#endif //__SIMPLEFUSE_H__
