
{{- define "go-echod0c5ab2d-b83f-4865-b9b8-53c43173ca65.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echod0c5ab2d-b83f-4865-b9b8-53c43173ca65.fullname" -}}
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


{{- define "go-echod0c5ab2d-b83f-4865-b9b8-53c43173ca65.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echod0c5ab2d-b83f-4865-b9b8-53c43173ca65.labels" -}}
helm.sh/chart: {{ include "go-echod0c5ab2d-b83f-4865-b9b8-53c43173ca65.chart" . }}
{{ include "go-echod0c5ab2d-b83f-4865-b9b8-53c43173ca65.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echod0c5ab2d-b83f-4865-b9b8-53c43173ca65.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echod0c5ab2d-b83f-4865-b9b8-53c43173ca65.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}