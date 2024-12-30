
{{- define "go-echocee9ac2f-a02f-4dc7-a484-f12383d97042.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echocee9ac2f-a02f-4dc7-a484-f12383d97042.fullname" -}}
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


{{- define "go-echocee9ac2f-a02f-4dc7-a484-f12383d97042.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echocee9ac2f-a02f-4dc7-a484-f12383d97042.labels" -}}
helm.sh/chart: {{ include "go-echocee9ac2f-a02f-4dc7-a484-f12383d97042.chart" . }}
{{ include "go-echocee9ac2f-a02f-4dc7-a484-f12383d97042.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echocee9ac2f-a02f-4dc7-a484-f12383d97042.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echocee9ac2f-a02f-4dc7-a484-f12383d97042.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}