
{{- define "go-echob0a02cff-57ff-4818-8fd1-3ec8ceb174ec.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echob0a02cff-57ff-4818-8fd1-3ec8ceb174ec.fullname" -}}
{{- if .Values.fullnameOverride }}
{{- .Values.fullnameOverride | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- $name := default .Chart.Name .Values.nameOverride }}
{{- if contains $name .Release.Name }}
{{- .Release.Name | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- printf "%s-%s" .Release.Name $name | trunc 63 | trimSuffix "-" }}
{{- end }}
{{- end }}
{{- end }}


{{- define "go-echob0a02cff-57ff-4818-8fd1-3ec8ceb174ec.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echob0a02cff-57ff-4818-8fd1-3ec8ceb174ec.labels" -}}
helm.sh/chart: {{ include "go-echob0a02cff-57ff-4818-8fd1-3ec8ceb174ec.chart" . }}
{{ include "go-echob0a02cff-57ff-4818-8fd1-3ec8ceb174ec.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echob0a02cff-57ff-4818-8fd1-3ec8ceb174ec.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echob0a02cff-57ff-4818-8fd1-3ec8ceb174ec.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}