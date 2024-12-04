
{{- define "go-echof9861d4a-7db2-414a-8528-f6f3937a0eac.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echof9861d4a-7db2-414a-8528-f6f3937a0eac.fullname" -}}
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


{{- define "go-echof9861d4a-7db2-414a-8528-f6f3937a0eac.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echof9861d4a-7db2-414a-8528-f6f3937a0eac.labels" -}}
helm.sh/chart: {{ include "go-echof9861d4a-7db2-414a-8528-f6f3937a0eac.chart" . }}
{{ include "go-echof9861d4a-7db2-414a-8528-f6f3937a0eac.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echof9861d4a-7db2-414a-8528-f6f3937a0eac.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echof9861d4a-7db2-414a-8528-f6f3937a0eac.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}