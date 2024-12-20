
{{- define "go-echoed3a9c9c-60ff-4931-b77a-9cc73b1b463a.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoed3a9c9c-60ff-4931-b77a-9cc73b1b463a.fullname" -}}
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


{{- define "go-echoed3a9c9c-60ff-4931-b77a-9cc73b1b463a.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoed3a9c9c-60ff-4931-b77a-9cc73b1b463a.labels" -}}
helm.sh/chart: {{ include "go-echoed3a9c9c-60ff-4931-b77a-9cc73b1b463a.chart" . }}
{{ include "go-echoed3a9c9c-60ff-4931-b77a-9cc73b1b463a.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echoed3a9c9c-60ff-4931-b77a-9cc73b1b463a.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echoed3a9c9c-60ff-4931-b77a-9cc73b1b463a.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}