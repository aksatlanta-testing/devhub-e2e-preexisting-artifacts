
{{- define "go-echo43ea8ccf-b810-46d0-a59d-ac949013042c.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo43ea8ccf-b810-46d0-a59d-ac949013042c.fullname" -}}
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


{{- define "go-echo43ea8ccf-b810-46d0-a59d-ac949013042c.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo43ea8ccf-b810-46d0-a59d-ac949013042c.labels" -}}
helm.sh/chart: {{ include "go-echo43ea8ccf-b810-46d0-a59d-ac949013042c.chart" . }}
{{ include "go-echo43ea8ccf-b810-46d0-a59d-ac949013042c.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo43ea8ccf-b810-46d0-a59d-ac949013042c.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo43ea8ccf-b810-46d0-a59d-ac949013042c.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}