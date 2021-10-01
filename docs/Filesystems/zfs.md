# zfs

## Raid types
# zfs

## Raid types
* raid0 (striping)
    - no redundancy and best performance

* raid1 (mirroring)
    - excellent redundancy as you can lose every drive except one

* :warning: raid 2, raid 3 and raid 4
    - No longer used by the IT industry. Raid2 uses an equal amount of disks as dedicated
    ECC drives. Raid 3 and 4 use a single dedicated parity drive. None of these raids are
    used in production anymore due to horrible random read and write performance.

* raid5 or raidz
    - Distributes parity along with the data and can lose one physical drive before a
    raid failure. Because parity needs to be calculated raid 5 is slower then raid0,
    but raid 5 is much safer. RAID 5 requires at least three hard disks in which one(1)
    full disk of space is used for parity.

* raid6 or raidz2
    - Distributes parity along with the data and can lose two physical drives instead of
    just one like raid 5. Because more parity needs to be calculated raid 6 is slower then
    raid5, but raid6 is safer. raidz2 requires at least four disks and will use two(2) disks of space for parity.

* raid7 or raidz3
    - Distributes parity just like raid 5 and 6, but raid7 can lose three physical drives.
    Since triple parity needs to be calculated raid 7 is slower then raid5 and raid 6,
    but raid 7 is the safest of the three. raidz3 requires at least four,
    but should be used with no less then five(5) disks, of which three(3) disks of space
    are used for parity.

* raid10 or raid1+0 
    - Mirroring and striping of data. The simplest raid10 array has four disks and consists
    of two pairs of mirrors. Disk 1 and 2 are mirrors and separately disk 3 and 4 are 
    another mirror. Data is then striped (think raid0) across both mirrors.
    You can lose one drive in each mirror and the data is still safe.
    You can not lose both drives which make up one mirror,
    for example drives 1 and 2 can not be lost at the same time.
    Raid 10 's advantage is reading data is fast.
    The disadvantages are the writes are slow (multiple mirrors) and capacity is low.

* raid60 or raid6+0
    - Stripe of two or more raid6 volumes. You get the advantage of raid6 safety (lose two drives per raid6 array) and
    of raid0 striping read speeds. The negatives are the same as raid10.

* raid70 or raid7+0
    - Stripe of two or more raid7 volumes. Just like raid6, you take advantage of
    raid7 safety and raid0 striping read speeds, but lose capacity.