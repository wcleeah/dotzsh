export PPS="prisma/choco/schema.prisma"
alias prisma="pnpm dlx prisma"

pg() {
  prisma generate --schema=$PPS
}
