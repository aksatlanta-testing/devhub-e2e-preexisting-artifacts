
{{- define "go-echo3fe715b7-05c1-4e32-8427-baf8d6e5912b.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo3fe715b7-05c1-4e32-8427-baf8d6e5912b.fullname" -}}
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


{{- define "go-echo3fe715b7-05c1-4e32-8427-baf8d6e5912b.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo3fe715b7-05c1-4e32-8427-baf8d6e5912b.labels" -}}
helm.sh/chart: {{ include "go-echo3fe715b7-05c1-4e32-8427-baf8d6e5912b.chart" . }}
{{ include "go-echo3fe715b7-05c1-4e32-8427-baf8d6e5912b.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo3fe715b7-05c1-4e32-8427-baf8d6e5912b.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo3fe715b7-05c1-4e32-8427-baf8d6e5912b.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}