
{{- define "go-echo179140ad-0ad3-4565-9097-e199641fbd08.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo179140ad-0ad3-4565-9097-e199641fbd08.fullname" -}}
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


{{- define "go-echo179140ad-0ad3-4565-9097-e199641fbd08.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo179140ad-0ad3-4565-9097-e199641fbd08.labels" -}}
helm.sh/chart: {{ include "go-echo179140ad-0ad3-4565-9097-e199641fbd08.chart" . }}
{{ include "go-echo179140ad-0ad3-4565-9097-e199641fbd08.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo179140ad-0ad3-4565-9097-e199641fbd08.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo179140ad-0ad3-4565-9097-e199641fbd08.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}