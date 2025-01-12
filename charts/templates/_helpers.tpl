
{{- define "go-echoe5492726-3bdf-4f35-97e8-99eced6b6adb.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoe5492726-3bdf-4f35-97e8-99eced6b6adb.fullname" -}}
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


{{- define "go-echoe5492726-3bdf-4f35-97e8-99eced6b6adb.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoe5492726-3bdf-4f35-97e8-99eced6b6adb.labels" -}}
helm.sh/chart: {{ include "go-echoe5492726-3bdf-4f35-97e8-99eced6b6adb.chart" . }}
{{ include "go-echoe5492726-3bdf-4f35-97e8-99eced6b6adb.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echoe5492726-3bdf-4f35-97e8-99eced6b6adb.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echoe5492726-3bdf-4f35-97e8-99eced6b6adb.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}