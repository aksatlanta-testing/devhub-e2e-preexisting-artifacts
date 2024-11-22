
{{- define "go-echo0f1667bf-94b9-4a0c-9dcc-1143c8fb792d.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo0f1667bf-94b9-4a0c-9dcc-1143c8fb792d.fullname" -}}
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


{{- define "go-echo0f1667bf-94b9-4a0c-9dcc-1143c8fb792d.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo0f1667bf-94b9-4a0c-9dcc-1143c8fb792d.labels" -}}
helm.sh/chart: {{ include "go-echo0f1667bf-94b9-4a0c-9dcc-1143c8fb792d.chart" . }}
{{ include "go-echo0f1667bf-94b9-4a0c-9dcc-1143c8fb792d.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo0f1667bf-94b9-4a0c-9dcc-1143c8fb792d.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo0f1667bf-94b9-4a0c-9dcc-1143c8fb792d.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}