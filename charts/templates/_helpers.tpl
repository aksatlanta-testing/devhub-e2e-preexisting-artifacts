
{{- define "go-echoe2b2af0d-91c1-4198-bcdb-87df353c9e6d.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoe2b2af0d-91c1-4198-bcdb-87df353c9e6d.fullname" -}}
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


{{- define "go-echoe2b2af0d-91c1-4198-bcdb-87df353c9e6d.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoe2b2af0d-91c1-4198-bcdb-87df353c9e6d.labels" -}}
helm.sh/chart: {{ include "go-echoe2b2af0d-91c1-4198-bcdb-87df353c9e6d.chart" . }}
{{ include "go-echoe2b2af0d-91c1-4198-bcdb-87df353c9e6d.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echoe2b2af0d-91c1-4198-bcdb-87df353c9e6d.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echoe2b2af0d-91c1-4198-bcdb-87df353c9e6d.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}